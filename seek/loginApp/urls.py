from django.conf.urls import url
from loginApp import views

urlpatterns = [
    url(r'^login/',views.login,name="login")
]