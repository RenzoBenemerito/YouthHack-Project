from django.db import models

# Create your models here.

class user_account(models.Model):
    username = models.CharField(max_length=45,unique=True)
    password = models.CharField(max_length=45)

    def __str__(self):
        return self.username

class user_speaker(models.Model):
    user_id=models.ForeignKey(user_account)
    first_name=models.CharField(max_length=45)
    last_name=models.CharField(max_length=45)
    age=models.IntegerField(3)
    job_title=models.CharField(max_length=45)
    contact_number=models.CharField(max_length=45)
    email=models.CharField(max_length=45)

    def __str__(self):
        return self.user_id

class user_organization(models.Model):
    user_id=models.ForeignKey(user_account)
    organization_name=models.CharField(max_length=100, unique=True)
    representative=models.CharField(max_length=100)
    contact_number=models.CharField(max_length=45)
    email=models.CharField(max_length=45)

    def __str__(self):
        return self.user_id


# Add the remaining tables