# Generated by Django 5.0.2 on 2024-02-18 08:24

import django_ckeditor_5.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0003_aboutdetail_description'),
    ]

    operations = [
        migrations.AlterField(
            model_name='aboutdetail',
            name='description',
            field=django_ckeditor_5.fields.CKEditor5Field(verbose_name='Text'),
        ),
    ]