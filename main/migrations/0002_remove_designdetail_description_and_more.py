# Generated by Django 5.0.2 on 2024-02-17 17:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='designdetail',
            name='description',
        ),
        migrations.RemoveField(
            model_name='estatedetail',
            name='description',
        ),
        migrations.RemoveField(
            model_name='holidaydetail',
            name='description',
        ),
        migrations.RemoveField(
            model_name='interviewdetail',
            name='description',
        ),
        migrations.RemoveField(
            model_name='populardetail',
            name='description',
        ),
        migrations.RemoveField(
            model_name='productdetail',
            name='description',
        ),
    ]