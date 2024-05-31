from accounts.jwt import decode_jwt_token, generate_jwt_token
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view #type: ignore
from rest_framework.response import Response #type: ignore
from .models import User, Subscription, Card
from project import file_operations
import stripe
from django.conf import settings
import requests
import stripe
from allauth.socialaccount.helpers import complete_social_login

CLIENT_ID = 'Ov23lilF0qPJ7JAM1eAb'
        
CLIENT_SECRET = 'dd6a74700502647f141349fea1c44fded976f7d7'

stripe.api_key = 'sk_test_51Oad4rK9FJ9sxaqhsEvY59vJpSptxiw5BxSuYOzF608SkhQABn5lO90C8wnbxFvRETDC4l2n8f693ZKuJg9rCpiK00O6rFN1pU'



def serialize_subscription(subscription):
    return {
        'plan_id': subscription.plan_id,
        'plan_name': subscription.plan_name,
        'project_create': subscription.project_create,
        'add_files': subscription.add_files,
        'file_size': subscription.file_size,
        'multifields': subscription.multifields,
        'chart_plots': subscription.chart_plots,
        'color_selection': subscription.color_selection,
        'custom_theme': subscription.custom_theme,
        'graph_limit': subscription.graph_limit,
        'logs': subscription.logs,
        'chart_download': subscription.chart_download,
        'shares': subscription.shares,
        'pdf_download': subscription.pdf_download
    }

def serialize_card(card):
    return {
        'id': card.id,
        'card_number': card.card_number,
        'holder_name': card.holder_name,
        'date': card.expiration_date,
        'cvv': card.cvv,
    }




@csrf_exempt
@api_view(['POST'])
def Authentication(request):
    token = request.COOKIES.get('token')
    if token:
        # try:
            JWT_str = decode_jwt_token(token)
            user = User.objects.get(email=JWT_str['email'])
            subscription = Subscription.objects.get(plan_id=user.plan)
            serialized_subscription = serialize_subscription(subscription)

            return Response({
                'message': 'Success',
                'userName': JWT_str['user'], 
                'email':JWT_str['email'], 
                'plan':user.plan,
                'files':user.add_files,
                'chartsDownload':user.chart_download,
                'chartPLot':user.chart_plots,
                'fileSize':user.file_size,
                'graphLimit':user.graph_limit,
                'multifields':user.multifields,
                'projects':user.project_create,
                'shareLimit':user.shares,
                'planData':serialized_subscription
                })
        # except Exception:
        #     return Response({'error': 'Invalid token'})
    else:
        return Response({'error': 'Token not found in cookies'})

    
@api_view(['POST'])
def register(request):
    if request.method == 'POST':
        existing_user = User.objects.filter(email=request.data.get('email')).first()
        if existing_user is None:

            user = User(username=request.data.get('name'), email=request.data.get('email'), password=request.data.get('password'), plan=1)

            file_operations.create(user.email)
            
            user.save()
            return Response({'message': 'Successfully Registered'})
        else:
            if existing_user.google != 0:
                return Response({'error': 'Already exists with google account'})
            else:
                return Response({'error': 'Already exists with github account'})
    else:
        return Response({'error': 'Something went wrong'})


@api_view(['POST'])
def googleLogin(request):
    if request.method == 'POST':
        existing_user = User.objects.filter(email=request.data.get('email')).first()
        if existing_user is None:
            user = User(google=1, username=request.data.get('name'), email=request.data.get('email'), password=settings.SECRET_KEY, plan=1)

            user.save()
            JWT = generate_jwt_token(user.username, user.email, user.id)

            response = Response({'message': 'Login Successfull.'})
            response.set_cookie('token', JWT, max_age=36000) 
            return response
        else:
            if existing_user.google is None:
                existing_user.google = 1
                existing_user.password=settings.SECRET_KEY
                existing_user.save()
            JWT = generate_jwt_token(existing_user.username, existing_user.email, existing_user.id)

            response = Response({'message': 'Login Successfull.'})
            response.set_cookie('token', JWT, max_age=36000) 
            return response
    else:
        return Response({'error': 'Failed to authenticate with Google'}, status=400)


@api_view(['POST'])
def github_callback(request):
    code = request.data.get('code')
    token_url = 'https://github.com/login/oauth/access_token'
    user_url = 'https://api.github.com/user'

    # Exchange code for access token
    
    token_response = requests.post(
        token_url,
        headers={'Accept': 'application/json'},
        data={
            'client_id': CLIENT_ID,
            'client_secret': CLIENT_SECRET,
            'code': code
        }
    )
    
    token_response_json = token_response.json()
    access_token = token_response_json.get('access_token')

    user_response = requests.get(
        user_url,
        headers={'Authorization': f'token {access_token}'}
    )

    user_data = user_response.json()

    existing_user = User.objects.filter(email=user_data['email']).first()

    if existing_user is None:
        user = User(github=user_data['id'], username=user_data['name'], email=user_data['email'], password=settings.SECRET_KEY, plan=1)

        file_operations.create(f'{user.email}_{user.id}')
        
        user.save()

        JWT = generate_jwt_token(user.username, user.email, user.id)

        response = Response({'message': 'Login Successfull.'})
        response.set_cookie('token', JWT, max_age=36000) 
        return response
    else:
        if existing_user.github is None:
            existing_user.github=user_data['id']
            existing_user.password=settings.SECRET_KEY
            existing_user.save()
        JWT = generate_jwt_token(existing_user.username, existing_user.email, existing_user.id)

        response = Response({'message': 'Login Successfull.'})
        response.set_cookie('token', JWT, max_age=36000) 
        return response


@api_view(['POST'])
def login(request):
    if request.method == 'POST':
        email = request.data.get('email')
        password = request.data.get('password')
        user = User.objects.filter(email=email).first()

        if user is None:
            return Response({'error': 'User does not exist'})
        
        if user.password == password:
            JWT = generate_jwt_token(user.username, user.email, user.id)

            response = Response({'success': 'Login Successfull.'})
            response.set_cookie('token', JWT, max_age=36000) 
            return response
        else:
            return Response({'error': 'Incorrect password'})
    else:
        return Response({'error': 'Method not allowed'})
    




@api_view(['GET'])
def getCard(request):
    if request.method == 'GET':
        token = request.COOKIES.get('token')

        try:
            user = decode_jwt_token(token)
        except:
            return Response({'error': 'Invalid token'}, status=401)

        existing_card = Card.objects.filter(user_id=user['user_id'])

        serialized_cards = [serialize_card(card) for card in existing_card]
        
        return Response({'cards': serialized_cards})
    else:
        return Response({'error': 'Invalid request method'})


@api_view(['POST'])
def storeCard(request):
    if request.method == 'POST':
        holder_name = request.data.get('holderName')
        card_number = request.data.get('cardNumber')
        expiration_date = request.data.get('date')
        cvv = request.data.get('CVV')
        token = request.COOKIES.get('token')

        try:
            user = decode_jwt_token(token)
        except:
            return Response({'error': 'Invalid token'}, status=401)

        existing_card = Card.objects.filter(card_number=card_number).first()
        if existing_card:
            return Response({'error': 'Credit card already exists'})
        userData = User.objects.filter(email=user['email']).first()
        new_card = Card.objects.create(
            user=userData,
            holder_name=holder_name,
            card_number=card_number,
            expiration_date=expiration_date,
            cvv=cvv
        )
        new_card.save()

        return Response({'message': 'Credit card information stored successfully'})
    else:
        return Response({'error': 'Invalid request method'})


@api_view(['POST'])
def deleteCard(request):
    if request.method == 'POST':
        token = request.COOKIES.get('token')
        cardId = request.data.get('id')

        try:
            user = decode_jwt_token(token)
        except:
            return Response({'error': 'Invalid token'}, status=401)

        card = Card.objects.get(id=cardId)
        card.delete()
        return Response({'message': 'Card deleted successfully'})
    else:
        return Response({'error': 'Invalid request method'})

    


# @api_view(['POST'])
# def stripe_payment(request):
#     planId = request.data.get('planId')
#     cardId = request.data.get('cardId')
#     total_payment = request.data.get('payment')

#     token = request.COOKIES.get('token')
#     print(f'{token} {total_payment} {cardId} {planId}')

#     try:
#         user = decode_jwt_token(token)
#     except:
#         return Response({'error': 'Invalid token'}, status=401)

#     card = Card.objects.get(id=cardId)

#     card_number = card.card_number
#     expiration_date = card.expiration_date
#     expiration_month = expiration_date.month
#     expiration_year = expiration_date.year
#     cvv = card.cvv

#     payment_intent = stripe.PaymentIntent.create(
#         amount=int(total_payment) * 100,
#         currency='usd',
#         payment_method_types=['card'],
#         payment_method_data={
#             'type': 'card',
#             'card': {
#                 'number': card_number,
#                 'exp_month': expiration_month,
#                 'exp_year': expiration_year,
#                 'cvc': cvv
#             },
#             'billing_details': {
#                 'name': card.holder_name,
#                 'email': user['email'],
#             },
#         },
#     )
            # 'token': 'tok_mastercard',


#     if payment_intent.status == 'succeeded':
#         userData = User.objects.get(id=user['user_id'])
#         userData.plan = planId
#         userData.save()
#         return Response({'message': 'Payment Successful.'})
#     else:
#         return Response({'error': 'Payment Failed.'}, status=400)

# def stripe_payment(request):
#     user = request.user

#     total_payment = request.POST.get('total') 

#     session = stripe.checkout.Session.create(
#         payment_method_types=['card'],
#         line_items=[{
#             'price_data': {
#                 'currency': 'gbp',
#                 'unit_amount': int(total_payment) * 100,
#                 'product_data': {
#                     'name': 'Tapit',
#                 },
#             },
#             'quantity': 1,
#         }],
#         mode='payment',
#         success_url=request.build_absolute_uri('success'),  
#         cancel_url=request.build_absolute_uri('cancel'),    
#         )

#     return Response({'message': 'Payment Successfull.'})


# @api_view(['POST'])
# def stripe_payment(request):
#     planId = request.data.get('planId')
#     cardId = request.data.get('cardId')
#     total_payment = request.data.get('payment')

#     try:
#         token = request.COOKIES.get('token')
#         user = decode_jwt_token(token)
#     except:
#         return Response({'error': 'Invalid token'}, status=401)

#     card = Card.objects.get(id=cardId)

#     card_number = card.card_number
#     expiration_date = card.expiration_date
#     expiration_month = expiration_date.month
#     expiration_year = expiration_date.year
#     cvv = card.cvv
    
#     token_response = stripe.Token.create(
#             card={
#                 'number': card_number,
#                 'exp_month': expiration_month,
#                 'exp_year': expiration_year,
#                 'cvc': cvv
#             }
#         )

#     # Use the token to create a payment intent
#     payment_intent = stripe.PaymentIntent.create(
#         amount=int(total_payment) * 100,
#         currency='usd',
#         payment_method_data={
#             'type': 'pm_card_visa',
#             'card': token_response,
            
#         },
#         confirm=True,
#         return_url= 'http://192.168.1.76:3000/'
#     )

#     if payment_intent.status == 'succeeded':
#         userData = User.objects.get(id=user['user_id'])
#         userData.plan = planId
#         userData.save()
#         return Response({'message': 'Payment Successful.'})
#     else:
#         return Response({'error': 'Payment Failed.'}, status=400)

@api_view(['POST'])
def updateProfile(request):
    if request.method == 'POST':
        token = request.COOKIES.get('token')
        try:
            user = decode_jwt_token(token)
        except:
            return Response({'error': 'Invalid token'}, status=401)
        name = request.data.get('username')
        email = request.data.get('email')
        password = request.data.get('password')

        if password is None:
            user = User.objects.get(email=email)
            user.username = name
            user.email = email
            user.save()

            return Response({'message': 'Successfully Updated'})
        else:
            user = User.objects.get(email=email)
            user.username = name
            user.email = email
            user.password = password
            user.save()

            return Response({'message': 'Successfully Updated'})
    else:
        return Response({'error': 'Something went wrong'})


@api_view(['GET'])
def logout(request):
    if request.method == 'GET':
        token = request.COOKIES.get('token')
        try:
            user = decode_jwt_token(token)
        except:
            return Response({'error': 'Invalid token'}, status=401)
        if token:
            response = Response({'message': 'Success'})
            response.delete_cookie('token')

            return response
        else:
            return Response({'error': 'Token not found in cookies'})
    else:
        return Response({'error': 'Method not allowed'})
    





