drop database if exists carpooling;
create database carpooling;
use carpooling;

create table destinations
(
    destination_id int auto_increment
        primary key,
    destination    varchar(100) not null
);

create table optionals
(
    optional_id int         not null
        primary key,
    optional    varchar(50) not null
);

create table role
(
    role_id int auto_increment
        primary key,
    type    varchar(50) not null
);

create table users
(
    user_id      int auto_increment
        primary key,
    username     varchar(20)  not null,
    password     varchar(50)  not null,
    first_name   varchar(20)  not null,
    last_name    varchar(20)  not null,
    email        varchar(255) not null,
    phone_number varchar(10)  not null,
    is_blocked   tinyint(1)   not null,
    role         int          not null,
    is_deleted   tinyint(1)   not null
);

create table feedbacks
(
    feedback_id  int auto_increment
        primary key,
    rating       float      not null,
    from_user_id int        not null,
    to_user_id   int        not null,
    is_deleted   tinyint(1) not null,
    constraint feedbacks_users_user_id_fk
        foreign key (from_user_id) references users (user_id),
    constraint feedbacks_users_user_id_fk2
        foreign key (to_user_id) references users (user_id)
);

create table comments
(
    comment_id  int auto_increment
        primary key,
    text        varchar(5000) not null,
    feedback_id int           not null,
    constraint comments_feedbacks_feedback_id_fk
        foreign key (feedback_id) references feedbacks (feedback_id)
);

create table travels
(
    travel_id          int auto_increment
        primary key,
    starting_point_id  int       not null,
    ending_point_id    int       not null,
    departure_time     timestamp null,
    free_seats         int(10)   not null,
    created_by_user_id int       not null,
    constraint travels___fk
        foreign key (starting_point_id) references destinations (destination_id),
    constraint travels_destinations_destination_id_fk
        foreign key (ending_point_id) references destinations (destination_id),
    constraint travels_users_user_id_fk
        foreign key (created_by_user_id) references users (user_id)
);

create table travels_optionals
(
    travel_optional_id int not null
        primary key,
    travel_id          int not null,
    optional_id        int not null,
    constraint travels_optionals_optionals_optional_id_fk
        foreign key (optional_id) references optionals (optional_id),
    constraint travels_optionals_travels_travel_id_fk
        foreign key (travel_id) references travels (travel_id)
);

create table users_roles
(
    users_roles_id int auto_increment
        primary key,
    user_id        int not null,
    role_id        int not null,
    constraint users_roles_role_role_id_fk
        foreign key (role_id) references role (role_id),
    constraint users_roles_users_user_id_fk
        foreign key (user_id) references users (user_id)
);