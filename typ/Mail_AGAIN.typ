#import "../format/report_format.typ": *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/codelst:2.0.0": sourcecode
// #import "@preview/physica:0.9.2"

#show: master_thesis.with(
  title: "",
  subtitle: "AGAIN data set",
  author: "Tatsuya Kawaguchi",
  id: "",
  university: "JAIST",
  bibliography-file: none,
)

= Uncertain Feature Definitions

player_damaged: Damage received by the player\
player_projectile_count: Number/intensity of player projectiles\
player_projectile_distance: Distance from the player to player projectiles\

bot_damaged: Damage received by enemies\
bot_projectile_count: Number/intensity of enemy projectiles\
bot_projectile_player_distance: Distance from enemy projectiles to the player\

pick_ups_visible: Number of visible pickups\
pick_up_player_distance: Distance to pickups\

player_respawn: Player respawn event/intensity\

bot_delta_rotation: Enemy rotation since previous frame (Racing)\

bot_respawn: Enemy respawn event/intensity\

player_healing: Healing state/intensity\

bot_delta_rotation: Enemy rotation since previous frame (FPS)\

player_has_collisions: Player has collision(s)\
player_is_colliding_above: Collision above\
player_is_colliding_below: Collision below\
player_is_colliding_left: Collision on the left\
player_is_colliding_right: Collision on the right\

player_point_pickup: Point pickup event/intensity\
player_power_pickup: Power-up pickup event/intensity\
player_boost_pickup: Speed boost pickup event/intensity\
player_slow_pickup: Slow-down pickup event/intensity\
player_has_powerup: Player has a power-up\

bot_has_collisions: Enemy has collision(s)\
bot_is_colliding_above: Enemy collision above\
bot_is_colliding_below: Enemy collision below\
bot_is_colliding_left: Enemy collision on the left\
bot_is_colliding_right: Enemy collision on the right\

bot_charging: Enemy charging state/intensity\
\
= Likely Boolean / Binary Features

player_shooting: Player is shooting\
bot_shooting: Enemy is shooting\

player_death: Player death\

player_reloading: Player is reloading\
player_crouching: Player is crouching\
player_sprinting: Player is sprinting\

player_aim_at_enemy: Player is aiming at an enemy\
player_aim_at_destructible: Player is aiming at a destructible object\
player_tries_shoot_on_reload: Player attempts to shoot while reloading\

bot_reloading: Enemy is reloading\
bot_aim_at_player: Enemy is aiming at the player\

player_is_falling: Player is falling\
player_is_jumping: Player is jumping\

bot_is_falling: Enemy is falling\
bot_is_jumping: Enemy is jumping\

\

= Likely Well-defined Features

// Output
[output]arousal: Change in arousal

// General
[general]time_passed: Elapsed time since the start of the game\
[general]input_intensity: Number of key/button inputs\
[general]input_diversity: Number of different input keys/buttons\
[general]activity: Ratio of time with player input\
[general]score: Score\
[general]bot_count: Number of visible enemies\
[general]bot_diversity: Number of different visible enemy types\
[general]bot_movement: Enemy movement amount\
[general]player_movement: Player movement amount\
[general]object_intensity: Number of visible objects of interest\
[general]object_diversity: Number of different object types\
[general]event_intensity: Number of events
[general]event_diversity: Number of different event types\

// Untagged
key_press_count: Number of key/button inputs\
idle_time: Ratio of time without input\

player_score: Player score\
player_delta_distance: Player movement since previous frame\

bot_delta_distance: Enemy movement since previous frame\
visible_bot_count: Number of visible enemies\

// Platformer / FPS
player_kill_count: Number of enemies killed\
player_speed_x: Player velocity (X)\
player_speed_y: Player velocity (Y)\
player_health: Player health\
player_health_pickup: Number/intensity of health pickups\

bot_speed_x: Enemy velocity (X)\
bot_speed_y: Enemy velocity (Y)\
bot_health: Average enemy health\

// Platformer / Racing
player_is_grounded: Player is on the ground\
bot_player_distance: Average distance to enemies\
bot_is_grounded: Enemy is on the ground\

// Racing / FPS
player_delta_rotation: Player rotation since previous frame\

// Racing
player_standing: Player standing state\
player_speed: Player speed\
player_speed_boost: Speed boost state\
player_is_mid_air: Player is airborne\
player_is_looping: Player is inside a loop\
player_is_crashing: Player is crashing\
player_is_off_road: Player is off-road\
player_gas_pedal: Accelerator input\
player_steering: Steering input\
player_lap: Current lap\
player_distance_to_way_point: Distance to next waypoint\

bot_standing: Enemy standing state\
bot_score: Average enemy score\
bot_speed: Average enemy speed\
bot_speed_boost: Enemy speed boost state\
bot_is_looping: Enemy is inside a loop\
bot_is_off_road: Enemy is off-road\
bot_is_crashing: Enemy is crashing\
bot_gas_pedal: Enemy accelerator input\
bot_steering: Enemy steering input\
bot_lap: Average enemy lap\
bot_distance_to_way_point: Enemy distance to waypoint\

visible_jump_count: Number of visible jump pads\
visible_speed_boost_count: Number of visible speed boosts\
visible_obstacle_count: Number of visible obstacles\
visible_loop_count: Number of visible loops\

// FPS
player_speed_z: Player velocity (Z)\
reticle_delta_distance: Reticle movement distance\

bot_speed_z: Enemy velocity (Z)\

destructible_count: Number of destructible objects\
objects_destroyed: Number of destroyed objects\