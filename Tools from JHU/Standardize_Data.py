import numpy as pd

def standardize_data( data = None ):
    """
    This function returns the original dataset with the z-score for each data point.
    :param data:
    :return:
    """
    data = np.array( data )
    average  = np.mean( data )
    stnd_dev = np.std( data )
    [rows, columns] = data.shape
    z_scores = new_array( rows, columns )
    for counter_i in range( rows ):
        for counter_j in range( columns ):
            z_scores[counter_i][counter_j] = ( data[counter_i][counter_j] - average ) / stnd_dev
    return z_scores