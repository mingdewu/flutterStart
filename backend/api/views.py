from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import NoteSerializer
from .models import Note

@api_view(['GET'])
def getRoutes(request):
    routes = [
        {
            'Endpoint':'/notes/',
            'method':'GET',
            'body':None,
            'description': 'Returns an array of notes'
        },
        {
            'Endpoint':'/notes/id',
            'method':'GET',
            'body':None,
            'description': 'Returns a single note of object'
        },
        {
            'Endpoint':'/notes/create/',
            'method':'POST',
            'body':{
                'body':""
            },
            'description': 'Creating'
        },
        {
            'Endpoint':'/notes/id/update',
            'method':'PUT',
            'body':{
                'body':""
            },
            'description': 'Creats an existing note with date sent in database'
        },
        {
            'Endpoint':'/notes/id/delete',
            'method':'DELETE',
            'body':None,
            'description': 'Deletes and exiting note'
        },
    ]
    return Response(routes)

@api_view(['GET'])
def getNotes(request):
    notes = Note.objects.all()
    serializer = NoteSerializer(notes,many=True)
    return Response(serializer.data)