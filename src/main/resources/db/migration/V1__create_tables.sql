CREATE TABLE users (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL
);

CREATE TABLE team (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(1000),
    created_at TIMESTAMP NOT NULL
);

CREATE TABLE project (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(1000),
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP,
    created_at TIMESTAMP NOT NULL,
    team_id BIGINT,
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE task (
    id BIGINT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(1000),
    due_date TIMESTAMP NOT NULL,
    priority VARCHAR(255),
    status VARCHAR(255),
    created_at TIMESTAMP NOT NULL,
    project_id BIGINT,
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE team_user (
    team_id BIGINT,
    user_id BIGINT,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE activity_log (
    id BIGINT PRIMARY KEY,
    description TEXT,
    created_at TIMESTAMP NOT NULL,
    user_id BIGINT,
    task_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE comment (
    id BIGINT PRIMARY KEY,
    content TEXT,
    created_at TIMESTAMP NOT NULL,
    task_id BIGINT,
    user_id BIGINT,
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE attached_file (
    id BIGINT PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    file_type VARCHAR(50) NOT NULL,
    file_size BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    comment_id BIGINT,
    FOREIGN KEY (comment_id) REFERENCES comment(id)
);