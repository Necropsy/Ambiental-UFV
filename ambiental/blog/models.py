# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Dados(models.Model):
    id = models.IntegerField(blank=True, null=True)
    zona = models.TextField(blank=True, null=True)
    bairro = models.TextField(blank=True, null=True)
    rua = models.TextField(blank=True, null=True)
    nome = models.TextField(blank=True, null=True)
    area_min = models.IntegerField(blank=True, null=True)
    testada_min = models.IntegerField(blank=True, null=True)
    taxa_ocp = models.TextField(blank=True, null=True)
    taxa_prm = models.IntegerField(blank=True, null=True)
    num_pav = models.IntegerField(blank=True, null=True)
    coef_aprov = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'dados'
