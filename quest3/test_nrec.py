# -*- coding: utf-8 -*-
"""
Created on Sun Aug 18 22:17:09 2022

@author: aakash-s
"""

import pytest

from .nrec import get_val

data = {
        'a':{
            'b':{
                'c':'d'
                }
            }
        }

@pytest.mark.parametrize("key, exp_val, msg", 
                         [
                            ("a/b/c", 'd', "Values not same"), 
                            ("a/b/d/f", "N/F", "Value Found")
                         ]
                        )
def test_val(key, exp_val, msg):
    '''
    Function will check against got value and expected value.
    
    Parameters
    ----------
        key : str
            Key of dict.
        exp_val : str
                expected value.
        msg : str
            message to be displayed.

    
    '''
    got_val = get_val(data, key)
    assert got_val == exp_val, msg + f"Got_val: {got_val}, Exp: {exp_val}"
