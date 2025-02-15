/obj/item/projectile/bullet/shotgun_slug
	name = "12g shotgun slug"
	damage = 50
	armour_penetration = 0

/obj/item/projectile/bullet/shotgun_beanbag
	name = "beanbag slug"
	damage = 0
	stamina = 80

/obj/item/projectile/bullet/incendiary/shotgun
	name = "incendiary slug"
	damage = 25

/obj/item/projectile/bullet/incendiary/shotgun/dragonsbreath
	name = "dragonsbreath pellet"
	damage = 5

/obj/item/projectile/bullet/shotgun_stunslug
	name = "stunslug"
	damage = 5
	knockdown = 100
	stutter = 5
	jitter = 20
	range = 7
	icon_state = "spark"
	color = "#FFFF00"

/obj/item/projectile/bullet/shotgun_meteorslug
	name = "meteorslug"
	icon = 'icons/obj/meteor.dmi'
	icon_state = "dust"
	damage = 25
	knockdown = 80
	hitsound = 'sound/effects/meteorimpact.ogg'

/obj/item/projectile/bullet/shotgun_meteorslug/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(ismovableatom(target))
		var/atom/movable/M = target
		var/atom/throw_target = get_edge_target_turf(M, get_dir(src, get_step_away(M, src)))
		M.safe_throw_at(throw_target, 3, 2)

/obj/item/projectile/bullet/shotgun_meteorslug/Initialize()
	. = ..()
	SpinAnimation()

/obj/item/projectile/bullet/shotgun_frag12
	name ="frag12 slug"
	damage = 25
	knockdown = 50

/obj/item/projectile/bullet/shotgun_frag12/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, 0, 1)
	return TRUE

/obj/item/projectile/bullet/pellet
	var/tile_dropoff = 0.75
	var/tile_dropoff_s = 1.25

/obj/item/projectile/bullet/pellet/shotgun_buckshot
	name = "buckshot pellet"
	damage = 14 //Up to 84 damage point blank

/*/obj/item/projectile/bullet/pellet/magnum_buckshot
	name = "magnum buckshot pellet"
	damage = 18.2 //Up to 109 damage point blank or x1.3 of ordinary buckshot*/

/obj/item/projectile/bullet/pellet/shotgun_rubbershot
	name = "rubbershot pellet"
	damage = 0
	stamina = 18.2

/obj/item/projectile/bullet/pellet/Range()
	..()
	if(damage > 0)
		damage -= tile_dropoff
	if(stamina > 0)
		stamina -= tile_dropoff_s
	if(damage < 0 && stamina < 0)
		qdel(src)

/obj/item/projectile/bullet/pellet/shotgun_improvised
	tile_dropoff = 0.55		//Come on it does 6 damage don't be like that.
	damage = 12

/obj/item/projectile/bullet/pellet/shotgun_improvised/Initialize()
	. = ..()
	range = rand(1, 8)

/obj/item/projectile/bullet/pellet/shotgun_improvised/on_range()
	do_sparks(1, TRUE, src)
	..()

// Mech Scattershot

/obj/item/projectile/bullet/scattershot
	damage = 25
	stamina = 65
