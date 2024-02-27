from smart_selects.form_fields import ChainedModelChoiceField
from .models import *
from django import forms


class ResidentForm(forms.ModelForm):
    subcategory = ChainedModelChoiceField(
        queryset='Resident.objects.all()',
        chained_field='category',
        chained_model_field='category',
        show_all=False,
        auto_choose=True
    )

    class Meta:
        model = Resident
        fields = ['category', 'subcategory', 'name']



