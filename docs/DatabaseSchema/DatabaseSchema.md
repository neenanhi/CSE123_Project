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

