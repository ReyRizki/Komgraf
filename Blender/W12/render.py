import bpy
from math import radians

def setup_camera(scene, rotation, location):
    scene.camera.rotation_euler = rotation
    scene.camera.location = location

def create_camera(rotation, location):
    scene = bpy.data.scenes["Scene"]
    
    bpy.ops.object.camera_add()
    cam = bpy.data.objects['Camera']
    cam.rotation_mode = 'XYZ'
    scene.camera = cam
    
    setup_camera(scene, rotation, location)
    
def render(filepath):
    bpy.context.scene.render.filepath = filepath
    bpy.ops.render.render(write_still = True)
    
def render_360(folder, distance):
    configs = [
        {
            "rotation": (radians(90), radians(0), radians(90)), 
            "location": (distance, 0, 0), 
            "filename": "left.jpg" 
        },
        { 
            "rotation": (radians(90), radians(0), radians(-90)), 
            "location": (-distance, 0, 0), 
            "filename": "right.jpg" 
        },
        { 
            "rotation": (radians(90), radians(0), radians(0)), 
            "location": (0, -distance, 0), 
            "filename": "front.jpg" 
        },
        { 
            "rotation": (radians(90), radians(0), radians(180)), 
            "location": (0, distance, 0), 
            "filename": "back.jpg" 
        },
        { 
            "rotation": (radians(0), radians(0), radians(0)), 
            "location": (0, 0, distance), 
            "filename": "top.jpg" 
        },
        { 
            "rotation": (radians(0), radians(180), radians(0)), 
            "location": (0, 0, -distance), 
            "filename": "bottom.jpg" 
        }
    ]

    for config in configs:
        create_camera(config["rotation"], config["location"])

        filepath = folder + config["filename"]
        render(filepath)
    
        bpy.ops.object.delete()
    
folder = "/media/reyrizki/Seagate Backup Plus Drive1/Kuliah/Matkul/Semester 4/Komputer Grafik/Praktek/Pertemuan/W13/Rendering/Graphic/pow(x, 3)/"
distance = 30
render_360(folder, distance)
