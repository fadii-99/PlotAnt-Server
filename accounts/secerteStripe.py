import stripe

def initiate_payment(total_payment, tokenId):
    stripe.api_key = 'sk_test_51Oad4rK9FJ9sxaqhsEvY59vJpSptxiw5BxSuYOzF608SkhQABn5lO90C8wnbxFvRETDC4l2n8f693ZKuJg9rCpiK00O6rFN1pU'

    token = stripe.Token.retrieve(tokenId)

    card = token['card']

    card_brand = card['brand']

    payment = stripe.Charge.create(
            amount= int(total_payment)*100,         
            currency='usd',
            description='Example charge',
            source=tokenId,
            )
    if payment['paid']:
        return True
    else:
        return False


def identify_card_type(token_id):
    stripe.api_key = 'sk_test_51Oad4rK9FJ9sxaqhsEvY59vJpSptxiw5BxSuYOzF608SkhQABn5lO90C8wnbxFvRETDC4l2n8f693ZKuJg9rCpiK00O6rFN1pU'

    token = stripe.Token.retrieve(token_id)

    card = token['card']

    card_brand = card['brand']

    if 'funding' in card:
        card_funding = card['funding']
        card_type = f"{card_brand} {card_funding.capitalize()}"
    else:
        card_type = f"{card_brand} (type not determined)"
    
    return card_type