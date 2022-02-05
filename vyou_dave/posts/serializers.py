from rest_framework import serializers

from .models import Post

#from .permissions import IsAuthenticatedOrReadOnly
#For user authentication purposes


from django.contrib.auth.models import User



class PostSerializer(serializers.HyperlinkedModelSerializer):
    
    owner = serializers.ReadOnlyField(source='owner.username')
    #permission_classes = [permissions.IsAuthenticatedOrReadOnly,
    #                  IsOwnerOrReadOnly]


    class Meta:
        model = Post
        fields = '__all__'


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'posts']