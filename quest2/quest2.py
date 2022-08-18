import json
from googleapiclient import discovery

def get_response(project, zone, instance):
    '''
    Query metadata of VM, returns output in dictionary format.

    Parameters
    ----------
        project : str
                The project ID under which VM is created.
        zone : str
                The zone ID under which VM is created.
        instance : str
                The name of VM needs to be queried.                        
    '''

    service = discovery.build('compute', 'v1')
    request = service.instances().get(project=project, zone=zone, instance=instance)
    response = request.execute()    
    return response

def various_converter(p):
    '''
    Processes output of get_response function to get only Metadata, converts 
    and returns it into both json and dictionary format.

    Parameters
    ----------
        p : dict
            The dictionary received as output of get_response function.    
    '''

    x = json.dumps(p['metadata']) # p is 'response' returned from get_response in json format.
    y = json.loads(x) # y is the dictionary created having only metadata key-values only.
    return x, y

def get_d_k(z, key=None): # z is the dict returned from various_converter.
    '''
    Returns whole metadata as a dictionary if specific key isn't provided  
    or returns value of specific key.

    Parameters
    ----------
        z : dict
            dict returned from various_converter function (loads output)
        key : str, optional
                If output of any specific key is desired, Optional if not
                provided will give output of whole metadata as a 
                key-value pair.    

    '''

    if key:
        return(z[key]) # key is any specific key of metadata dict.
    else:
        for k, val in z.items():
            return(z.items())

if __name__ =='__main__':

    #driver code
    t = get_response('friendlychat-e3857', 'us-west4-b', 'my-vm')
    print(f't = {t}')
    u, v = various_converter(t)
    print(f'u = {u}')
    print(f'v = {v}')
    w = list(get_d_k(v))
    print(f'w = {w}')
    h = list(get_d_k(v, "items"))
    print(f'h= {h}')
    