from django.contrib import admin
from . models import user_account, user_speaker, user_organization

admin.site.register(user_account)
admin.site.register(user_speaker)
admin.site.register(user_organization)