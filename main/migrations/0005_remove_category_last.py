# Generated by Django 4.2 on 2024-03-16 07:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0004_category_last'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='category',
            name='last',
        ),
    ]