import bpy
import random

def clear_scene():
    for obj in bpy.data.objects:
        if(obj.name != "Sun"):
            bpy.data.objects.remove(obj)
            
    for mtr in bpy.data.materials:
        bpy.data.materials.remove(mtr)
        
def translate_object(x, y, z):
    bpy.ops.transform.translate(value=(x, y, z), orient_type='LOCAL', orient_matrix=((1, 0, 0), (0, 1, 0), (0, 0, 1)), orient_matrix_type='LOCAL', constraint_axis=(True, True, True), mirror=True, use_proportional_edit=False, proportional_edit_falloff='SMOOTH', proportional_size=1, use_proportional_connected=False, use_proportional_projected=False)

def create_bar(label, height):
    bpy.ops.mesh.primitive_cube_add(size=1, enter_editmode=False, align='WORLD', location=(0, 0, height/2), scale=(1, 1, height))
    translate_object(0, i, 0);
    
    bpy.ops.object.text_add()
    bpy.context.object.data.body = label
    translate_object(1, i, 0);

clear_scene()

days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
study_data = []

for i in range(15):
    study_data.append({ "label": days[i % 7], "data": random.randint(0,16) })

for i in range(len(study_data)):
    create_bar(study_data[i]["label"], study_data[i]["data"])
