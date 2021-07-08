import bpy
import random
from math import radians, sin, cos, tan, pi
from mathutils import Matrix

def clear_scene():
    for obj in bpy.data.objects:
        if(obj.name != 'Sun'):
            bpy.data.objects.remove(obj)
            
    for mtr in bpy.data.materials:
        bpy.data.materials.remove(mtr)

def rotate_point(center, point, degree):
    vcos = cos(radians(degree))
    vsin = sin(radians(degree))

    x1=point[0]
    y1=point[1]

    x2=center[0]
    y2=center[1]

    rotX = (vcos * (x2 - x1)) + (-vsin * (y2 - y1)) + x1
    rotY = (vsin * (x2 - x1)) + (vcos * (y2 - y1)) + y1

    return (rotX,rotY)
        
def create_fence(height=10, width=0.25, x = 0, y = 0, degree = 0, name="Cube"):
    # create the fence
    bpy.ops.mesh.primitive_cube_add(size=1, enter_editmode=False, align='WORLD')
    
    # transform
    fence = bpy.context.object
    fence.name = name
    fence.location = (x, y, 0)
    fence.scale = (1, width, height)
    fence.rotation_euler = (0, 0, radians(degree))
    
    ru_r = random.uniform(0,1)
    ru_g = random.uniform(0,1)
    ru_b = random.uniform(0,1)
    
    # give material
    material = bpy.data.materials.new('material')
    material.diffuse_color = (abs(ru_r), abs(ru_g), abs(ru_b), 1)
    bpy.context.object.data.materials.append(material)
        
def polygonal_fence(faces, length, gap, width = 0):
    # calculate degree
    degree = 360 / faces
    
    # initialize length, width, and center
    if (width == 0):
        width = length
        
    is_rectangle = (width != length) and (faces == 4)
    
    total_length = (length * 1) + ((length - 1) * gap)
    total_width = (width * 1) + ((width - 1) * gap)
    center = (total_length / 2, (total_width / 2) if is_rectangle else (tan(radians((180 - degree) / 2)) * total_length / 2))
    print(center)
    
    for i in range(faces):
        # draw fence
        fences = (width if ((i & 1) and is_rectangle) else length) 
        for j in range(fences):
            create_fence(10, 0.25, (1 + gap) * j, 0, 0, "Cube." + str(i) + "." + str(j))
        
        # select fences
        for j in range(fences):
            bpy.data.objects["Cube." + str(i) + "." + str(j)].select_set(True)
        
        # decide position
        total = (total_width if ((i & 1) and is_rectangle) else total_length) 
        current = (total / 2, 0)
        target = (0, 0)
        if ((i & 1) and is_rectangle):
            target = (((i - 1) / 2) * length, width / 2)
        else:
            target = rotate_point(current, center, i * degree)
        diff = (target[0] - current[0], target[1] - current[1])
        
        bpy.ops.transform.translate(value=(diff[0], diff[1], 0), orient_type='LOCAL', orient_matrix=((1, 0, 0), (0, 1, 0), (0, 0, 1)), orient_matrix_type='LOCAL', constraint_axis=(False, False, False), mirror=True, use_proportional_edit=False, proportional_edit_falloff='SMOOTH', proportional_size=1, use_proportional_connected=False, use_proportional_projected=False)
        
        bpy.ops.transform.translate(value=(-center[0], -center[1], 0), orient_type='LOCAL', orient_matrix=((1, 0, 0), (0, 1, 0), (0, 0, 1)), orient_matrix_type='LOCAL', constraint_axis=(False, False, False), mirror=True, use_proportional_edit=False, proportional_edit_falloff='SMOOTH', proportional_size=1, use_proportional_connected=False, use_proportional_projected=False)
        
        # rotate
        bpy.ops.transform.rotate(value=radians(-i * degree), orient_axis='Z', orient_type='LOCAL', orient_matrix=((1, 0.0, 0.0), (0.0, 1, 0.0), (0.0, 0.0, 1)), orient_matrix_type='LOCAL', constraint_axis=(False, False, False), mirror=True, use_proportional_edit=False, proportional_edit_falloff='SMOOTH', proportional_size=1.0, use_proportional_connected=False, use_proportional_projected=False, snap=False, snap_target='CLOSEST', snap_point=(0.0, 0.0, 0.0), snap_align=False, snap_normal=(0.0, 0.0, 0.0), gpencil_strokes=False, release_confirm=False, use_accurate=True)
        
        bpy.ops.object.select_all(action='DESELECT')

clear_scene()
polygonal_fence(8, 5, 0)