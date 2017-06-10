from django.shortcuts import render

# Addition
from loginApp.loginForm import LoginForm

# Create your views here.
def index(request):
    return render(request,'index.html')

def login(request):
    return render(request,'loginApp/login.html')

def validateLogin(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            print("Form validation success")
            print(form.cleaned_data['username'])
            print(form.cleaned_data['password'])
            return render(request,'index.html')
    else:
        form = LoginForm()
    return render(request,'loginApp/login.html',{'form':form})