use bevy::ecs::component::Component;
use bevy::prelude::*;
use bevy::window::PrimaryWindow;

#[derive(Component)]
struct Player {
    pub speed: f32,
}

#[derive(Component)]
struct Ball;

#[derive(Component, Deref, DerefMut)]
struct Velocity(Vec2);

fn main() {
    App::new()
        .add_plugins(DefaultPlugins)
        .add_systems(Startup, setup)
        .add_systems(Update, (move_player, apply_velocity.after(move_player)))
        .run();
}

fn setup(mut commands: Commands, asset_server: Res<AssetServer>) {
    commands.spawn(Camera2d::default());

    commands.spawn((
        Sprite {
            custom_size: Some(Vec2::new(150.0, 25.0)),
            color: Color::srgb(0.9, 0.9, 1.),
            ..default()
        },
        Transform::from_xyz(0.0, -200.0, 0.0),
        Player { speed: 200.0 },
    ));

    let ball_texture = asset_server.load("textures/circle.png");
    commands.spawn((
        Sprite {
            color: Color::srgb(1., 0.8, 0.8),
            image: ball_texture,
            custom_size: Some(Vec2::new(25.0, 25.0)),
            ..default()
        },
        Ball,
        Velocity(400.0 * Vec2::new(0.5, -0.5)),
    ));
}

fn apply_velocity(mut balls: Query<(&mut Transform, &Velocity)>, time: Res<Time>) {
    let pos_based_on_time = time.delta_secs();

    if time.elapsed_secs() >= 1. {
        for (mut transform, velocity) in &mut balls {
            transform.translation.x += velocity.x * pos_based_on_time;
            transform.translation.y += velocity.y * pos_based_on_time;
        }
    }
}

fn move_player(
    mut windows: Query<&mut Window, With<PrimaryWindow>>,
    mut players: Query<(&mut Transform, &Player)>,
    input: Res<ButtonInput<KeyCode>>,
    time: Res<Time>,
) {
    for window in &mut windows {
        for (mut transform, player) in &mut players {
            let speed = player.speed * (time.delta_secs() * 2.);

            if input.pressed(KeyCode::KeyD) {
                if !(transform.translation.x == (window.height() / 2.)) {
                    transform.translation.x += speed;
                }
            }
            if input.pressed(KeyCode::KeyA) {
                if !(transform.translation.x == (window.height() / 2.) * -1.) {
                    transform.translation.x -= speed;
                }
            }
        }
    }
}
