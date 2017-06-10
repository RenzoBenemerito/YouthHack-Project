from django.conf.urls import url
from loginApp import views

urlpatterns = [
    url(r'^login/',views.validateLogin,name="login")
]