# Generated by Django 5.0.2 on 2024-02-20 09:59

import ckeditor.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0003_designdetail_description_estatedetail_description_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='designdetail',
            name='description',
            field=ckeditor.fields.RichTextField(blank=True, null=True, verbose_name='Текст'),
        ),
        migrations.AlterField(
            model_name='estatedetail',
            name='description',
            field=ckeditor.fields.RichTextField(verbose_name='Text'),
        ),
        migrations.AlterField(
            model_name='holidaydetail',
            name='description',
            field=ckeditor.fields.RichTextField(blank=True, null=True, verbose_name='Текст'),
        ),
        migrations.AlterField(
            model_name='interviewdetail',
            name='description',
            field=ckeditor.fields.RichTextField(blank=True, null=True, verbose_name='Текст'),
        ),
        migrations.AlterField(
            model_name='populardetail',
            name='description',
            field=ckeditor.fields.RichTextField(blank=True, null=True, verbose_name='Текст'),
        ),
        migrations.AlterField(
            model_name='productdetail',
            name='description',
            field=ckeditor.fields.RichTextField(blank=True, null=True, verbose_name='Текст'),
        ),
    ]
