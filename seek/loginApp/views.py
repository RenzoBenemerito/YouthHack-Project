from django.shortcuts import render
from django.shortcuts import HttpResponse

# Addition
from loginApp.loginForm import LoginForm
from loginApp.models import user_account,user_organization,user_speaker

# Create your views here.
def index(request):
    return render(request,'index.html')

def login(request):
    return render(request,'loginApp/login.html')

def validateLogin(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            getusername=form.cleaned_data['username']
            getpassword=form.cleaned_data['password']
            nameval =user_account.objects.get
            passval =user_account.objects.
            print(nameval,passval)
            if(nameval == getusername and passval == getpassword):
                return render(request,'index.html')
            else:
                return HttpResponse('Login Failed')
            
    else:
        form = LoginForm()
    return render(request,'loginApp/login.html',{'form':form})