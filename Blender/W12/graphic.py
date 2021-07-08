import bpy

def clear_scene():
    for obj in bpy.data.objects:
        if(obj.name != 'Sun'):
            bpy.data.objects.remove(obj)
            
    for mtr in bpy.data.materials:
        bpy.data.materials.remove(mtr)
        
def math_function(equation):
    bpy.ops.mesh.primitive_z_function_surface(equation=equation, div_x=256, div_y=3, size_x=5, size_y=1)
    bpy.ops.object.modifier_add(type='SOLIDIFY')
    bpy.context.object.modifiers["Solidify"].thickness = 0.25
    bpy.ops.object.modifier_apply(apply_as='DATA', modifier="Solidify")
        
clear_scene()
math_function("pow(x, 3)")