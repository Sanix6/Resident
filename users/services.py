# from .models import User
# from django.conf import settings
# import requests


# def send_sms(phone, message, code):
#     # user = User.objects.get(phone=phone)
#     xml_data = f"""<?xml version="1.0" encoding="UTF-8"?><message><login>{settings.NIKITA_LOGIN}</login><pwd>{settings.NIKITA_PASSWORD}</pwd><sender>{settings.NIKITA_SENDER}</sender><text>SMSPRO_KG</text><phones><phone>{settings.RESIDENT_NUMBER}</phone></phones></message>"""

#     headers = {"Content-Type": "application/xml"}

#     url = "https://smspro.nikita.kg/api/message"

#     response = requests.post(url, data=xml_data.encode("utf-8"), headers=headers)

#     # print(f"\n\n{response.text}\n\n")

#     if response.status_code == 200:
#         return True
#     return False