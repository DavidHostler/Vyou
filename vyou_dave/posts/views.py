from django.shortcuts import render

from rest_framework import viewsets, generics

from .serializers import PostSerializer, UserSerializer
from .models import Post
from .permissions import IsOwnerOrReadOnly

from rest_framework import permissions
from django.contrib.auth.models import User



# Create your views here.


class PostViewSet(viewsets.ModelViewSet):
    
    queryset = Post.objects.all().order_by('post_id')
    serializer_class = PostSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly,
                      IsOwnerOrReadOnly]

    #For the users
    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


#User view data

class UserList(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


class UserDetail(generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer