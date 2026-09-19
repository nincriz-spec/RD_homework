drop database if exists recipes;
create database recipes;
use recipes;


create table users (
    user_id int unsigned not null auto_increment,
    email varchar(255) not null, 
    password  varchar(255) not null, 
    primary key (user_id),
    unique key (email)
);

create table cuisines (
    cuisine_id int unsigned not null auto_increment,
    name varchar(255) not null, 
    primary key (cuisine_id)
);

create table tags (
    tag_id int unsigned not null auto_increment,
    name varchar(255) not null, 
    primary key (tag_id)
);

create table recipes (
    recipe_id int unsigned not null auto_increment,
    title varchar(255) not null, 
    instructions text not null, --text 
    date_created datetime not null default current_timestamp,
    last_updated datetime not null default current_timestamp,
    cuisine_id int unsigned not null,
    user_id int unsigned not null,
    primary key (recipe_id),
    primary key  (cuisine_id) references cuisines(cuisine_id) 
    ON DELETE CASCADE,
    foreign key  (user_id) references users(user_id) 
    ON DELETE CASCADE
);

create table recipes_tags (
    recipe_tag_id int unsigned not null auto_increment, -- Adjusted name
    recipe_id int unsigned not null,
    tag_id int unsigned not null, -- Adjusted name (was ingredient_id)
   primary key(recipe_tag_id),
   foreign key (recipe_id) references recipes(recipe_id)
   ON DELETE CASCADE,
   foreign key  (tag_id) references tags(tag_id)
   ON DELETE CASCADE,
   unique key unique_recipe_tag (recipe_id, tag_id) -- Prevents duplicate tags on a recipe
);