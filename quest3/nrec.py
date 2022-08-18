def get_val(data, key):
    '''
    To get value from a nested dict.

    Parameters
    ----------
        data : dict
                The nested dictionary.
        key : str
                Key of dict.
                
    '''
    from copy import deepcopy
    d = deepcopy(data)
    for k in key.split("/"):
        if isinstance(d, dict) and k in d:
            d = d[k]
        else:
            return "N/F"
    else:
        return d if k else d[key]
    
if __name__ == '__main__':
    '''
    Driver code
    '''
    data = {
            'a':{
                'b':{
                    'c':'d'
                    }
                }
            }
    keys = ['a', 'c/c1', 'c/c1/c_11', 'b/b1/b2', 'vd', 'a/b/c', 'p/q/r', 'b', 'c']
    for key in keys:
        vals = get_val(data, key)
        print(key, ":", vals)
