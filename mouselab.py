from pathlib import Path
from allensdk.core.mouse_connectivity_cache import MouseConnectivityCache
import numpy as np

def download_common_data(): 
    print('Downloading masks')
    for res in [25,50,100]:
        for sid in [997,8,512,703,1089,1097,315,313,354,698,771,803,477,549,73]:
            download_structure_mask(sid,res)
        print(f'Resolution {res}um completed')

    print('Downloading structure set information')
    for setid in [2,12,691663206,687527670,688152357]: 
        structure_set_info_to_json(setid)
        structure_set_info_to_csv(setid)
    print('Structure set information completed')

    print('Downloading connectome data')
    from mcmodels.core import VoxelModelCache
    manifest_file = Path(_get_mouselab_dir()/'voxel_model_manifest.json')
    cache = VoxelModelCache(manifest_file=manifest_file, resolution=100)
    voxel_array, source_mask, target_mask = cache.get_voxel_connectivity_array()
    print('Downloaded connectome data')

    print('Saving one small example connectome')
    save_connectome(184, 184, 2, 3)
    print('Saved connectome')

def download_structure_mask(structure_id=8, resolution=100):
    mcc = MouseConnectivityCache(resolution=resolution, manifest_file=_get_mouselab_dir()/'manifest.json')
    if isinstance(structure_id, int): 
        mcc.get_structure_mask(structure_id)
    elif isinstance(structure_id, list):
        for idx in structure_id: 
            mcc.get_structure_mask(idx)

def download_structure_set(structure_set_id=2, resolution=100): 
    mcc = MouseConnectivityCache(manifest_file=_get_mouselab_dir()/'manifest.json')
    structure_tree = mcc.get_structure_tree()
    summary_structures = structure_tree.get_structures_by_set_id([structure_set_id])
    download_structure_mask([a['id'] for a in summary_structures],100)

def structure_set_info_to_json(structure_set_id=2):
    import json
    mcc = MouseConnectivityCache(manifest_file=_get_mouselab_dir()/'manifest.json')
    structure_tree = mcc.get_structure_tree()
    summary_structures = structure_tree.get_structures_by_set_id([structure_set_id])
    with open(f'structures/{structure_set_id}.json', 'w') as f: 
        json.dump(summary_structures, f)

def structure_set_info_to_csv(structure_set_id=2):
    import pandas as pd
    mcc = MouseConnectivityCache(manifest_file=_get_mouselab_dir()/'manifest.json')
    structure_tree = mcc.get_structure_tree()
    summary_structures = structure_tree.get_structures_by_set_id([structure_set_id])
    (pd.DataFrame(summary_structures)).to_csv(f'structures/{structure_set_id}.csv')

def save_connectome(source_subset_structure_id, target_subset_structure_id, \
                    source_subset_hemisphere_id=2, target_subset_hemisphere_id=3):

    resolution = 100 # only resolution of 100 supported
    hl = {1:'L', 2:'R', 3:'B'}
    source_substring = str(source_subset_structure_id) + hl[source_subset_hemisphere_id]
    target_substring = str(target_subset_structure_id) + hl[target_subset_hemisphere_id]
    print(f'Saving connectome {source_substring} to {target_substring}...')
    
    from mcmodels.core import VoxelModelCache, Mask
    from mcmodels.models import VoxelModel
    import h5py
    cache = VoxelModelCache(manifest_file=Path('./voxel_model_manifest.json'), resolution=resolution)
    voxel_array, source_mask, target_mask = cache.get_voxel_connectivity_array()
    print('Data accessed')
    
    download_structure_mask(source_subset_structure_id, resolution=resolution)
    download_structure_mask(target_subset_structure_id, resolution=resolution)
    source_subset_mask = Mask.from_cache(cache, hemisphere_id=source_subset_hemisphere_id, structure_ids=[source_subset_structure_id])
    target_subset_mask = Mask.from_cache(cache, hemisphere_id=target_subset_hemisphere_id, structure_ids=[target_subset_structure_id])
    source_subset_idx = ismember_rows_index(source_subset_mask.coordinates, source_mask.coordinates)
    target_subset_idx = ismember_rows_index(target_subset_mask.coordinates, target_mask.coordinates)
    W = voxel_array[source_subset_idx, target_subset_idx]
    print('Connectome generated')
    
    connectome_filename = f'source-knox2018_desc-MouseConnectivity_space-ccf{source_substring}to{target_substring}_res-{resolution}um_feature.h5'
    connectome_filepath = _get_mouselab_dir()/'connectivity'/connectome_filename
    print(f'Saving at {connectome_filepath}')

    with h5py.File(connectome_filepath,'w') as f: 
        f.create_dataset('source_mask',        data=source_subset_mask.mask,        compression='gzip')
        f.create_dataset('source_coordinates', data=source_subset_mask.coordinates, compression='gzip')
        f.create_dataset('source_hemisphere',  data=source_subset_hemisphere_id)
        
        f.create_dataset('target_mask',        data=target_subset_mask.mask,        compression='gzip')
        f.create_dataset('target_coordinates', data=target_subset_mask.coordinates, compression='gzip')
        f.create_dataset('target_hemisphere',  data=target_subset_hemisphere_id)

        f.create_dataset('size', data=source_subset_mask.mask.shape, compression='gzip')
        f.create_dataset('resolution', data=resolution)
        f.create_dataset('W', data=W, compression='gzip')
    print('Complete')


def ismember_rows_index(A,B): 
    A_tuples = [tuple(row) for row in A]
    B_dict = {tuple(row): i for i, row in enumerate(B)}
    return np.array([B_dict.get(row, -1) for row in A_tuples])
    

def _get_mouselab_dir(): 
    return Path(__file__).parent.resolve()





    