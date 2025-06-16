type = bike
version = 2
id = template
chassis_mass = 0, 0.4190, -0.0380
chassis_steer = 0, 0.9834, 0.3326
chassis_rsusp_min = 0, 0.4948, -0.163
chassis_rsusp_max = 0, 0.4948, -0.163
swingarmpivot_steps = 0
fuel = 0, 0.8791, 0.0861
pressure_center = 0, 0.7791, 0.086
pressure_center_lat = 0, 0.4948, -0.163
pressure_center_vert = 0, 0.4948, -0.163
rider_mass = 0, 0.8792, 0.0578
rider = 0, 0.0236, 0
rider_view = 0, 1.1744, -0.239
front_sprocket = 0, 0.4948, -0.163
rear_sprocket = 0
chain_pitch = 0.0159
rakeangle_offset = 0
rakeangle_min = 27.5
rakeangle_max = 27.5
rakeangle_steps = 0
steer_mass = 0, -0.2205, -0.0152
steer_joint = 0, 0, -0.021
front_upper = 0, -0.4482, 0.0009
front_length = 0.286
front_lower = 0, -0.3099, 0
fsusp_mass = 0, -0.3411, 0.042
fsusp_type = Telescopic
fwheel = 0, -0.3411, 0.042
rsusp_mass = 0, -0.0501, -0.2859
rsusp_joint = 0, 0, 0
rear_length = 0.11
shock_minlength = 0.365
rsusp_type = Linkage Rod Chassis
shock_chassis = 0, 0.7881, -0.14
rocker_swingarm = 0, -0.0582, -0.1711
rocker_length = 0.042
rod_chassis = 0, 0.3993, -0.1948
rod_length = 0.148
shock_rocker = 0, 0.0534, 0.0518
ref_angle = -90
rwheel_min = 0, -0.0683, -0.5891
rwheel_max = 0, -0.0725, -0.6361
swingarm_steps = 10
t-cam = 0, 1.5, 0.05
stand_type = 1
stand_linkfront = 0, 0.3662, 0.0383
stand_linkrear = 0, 0.3583, -0.1745
ground_clearance_ref = 0, 0.3577, -0.0758
seat_height_ref = 0, 0.9807, -0.2154
coll
{
	chassis
	{
		numspheres = 2
		sphere0
		{
			pos = 0, 0.85, 0.25
			radius = 0.21
		}
		sphere1
		{
			pos = 0, 0.46, 0.1
			radius = 0.1
		}
		numboxes = 2
		box0
		{
			pos = 0, 0.95, -0.4
			size = 0.18, 0.05, 1.15
			pitch = 5
		}
		box1
		{
			pos = 0, 0.71, -0.12
			size = 0.15, 0.45, 0.65
			pitch = 5
		}
	}
	steer
	{
		numboxes = 2
		box0
		{
			pos = -0.2, 0.28, -0.035
			size = 0.25, 0.05, 0.05
			pitch = 80
		}
		box1
		{
			pos = 0.2, 0.28, -0.035
			size = 0.25, 0.05, 0.05
			pitch = 80
		}
	}
	fsusp
	{
		numspheres = 2
		sphere0
		{
			pos = -0.06, -0.338, 0.0515
			radius = 0.02
		}
		sphere1
		{
			pos = 0.06, -0.338, 0.0515
			radius = 0.02
		}
	}
	rsusp
	{
		numboxes = 1
		box0
		{
			pos = 0, -0.03, -0.3
			size = 0.21, 0.075, 0.625
			pitch = -7
		}
	}
}
