from django.urls import path
from .views import *


urlpatterns = [
    path("register", RegisterView.as_view(), name="register"),
    path("send-code", SendCodeView.as_view(), name="send-code"),
    path("login", LoginView.as_view(), name="login"),
    path("change-password", ChangePasswordView.as_view(), name="change-password"),
    path("delete-account", DeleteAccountView.as_view(), name="delete-account"),
]