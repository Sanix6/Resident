from random import randint
from django.db import models
from django.contrib.auth.models import AbstractUser, Group, Permission
from django.utils.translation import gettext_lazy as _
from .managers import CustomUserManager


class User(AbstractUser):
    USER_TYPE_CHOICES = (
        ("Журналист", _("Журналист")),
        ("Другое", _("Другое"))
    )
    groups = models.ManyToManyField(Group, related_name='custom_user_groups')
    user_permissions = models.ManyToManyField(Permission, related_name='custom_user_permissions')
    phone = models.CharField(_('Телефон номер'), unique=True, max_length=30)
    user_type = models.CharField(_('Статус'), choices=USER_TYPE_CHOICES, default="Журналист", max_length=100)
    code = models.IntegerField(_('Код активации'), null=True, blank=True)
    activated = models.BooleanField(_('Активировано'), default=False)

    USERNAME_FIELD = 'phone'
    REQUIRED_FIELDS = []

    objects = CustomUserManager()

    def save(self, *args, **kwargs):
        if not self.code:
            self.code = randint(100_000, 999_999)
        super(User, self).save(*args, **kwargs)

    def __str__(self):
        return self.phone
