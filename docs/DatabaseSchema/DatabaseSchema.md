# 🔐 Smart Lock Database Schema

This document outlines the database schema for our **Smart Lock** project, using **Firebase Firestore**.  
It supports a **many-to-many** relationship between `Users` and `Locks`.

---

## 📊 Entity-Relationship Diagram (ERD)

![ERD Diagram](lock_user_schema.png)

This ERD visualizes the relationship between these entities:

- `User`
- `Lock`
- `User_Lock` 

---

## 🧱 Firestore Collections & Structure

### 🧍‍♂️ `users` Collection

| Field               | Type        | Description                               |
|---------------------|-------------|-------------------------------------------|
| `user_id` (PK)       | `string`    | Document ID (primary key)                 |
| `email`              | `string`    | User's email address                      |
| `name`               | `string`    | User's display name                       |
| `associatedLockIds`  | `string[]`  | Array of Lock document IDs the user can access |

---

### 🔒 `locks` Collection

| Field               | Type        | Description                               |
|---------------------|-------------|-------------------------------------------|
| `lock_id` (PK)       | `string`    | Document ID (primary key)                 |
| `lockName`           | `string`    | Human-readable name for the lock          |
| `location`           | `string`    | Where the lock is physically installed    |
| `authorizedUserIds`  | `string[]`  | Array of User document IDs who can control this lock |

---

## 🔁 Many-to-Many Relationship

This structure allows for:
- One user ➝ many locks
- One lock ➝ many users

It's modeled using **arrays of document IDs** on both ends.  

