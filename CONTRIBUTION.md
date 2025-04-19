# Contributing Guidelines

This guide outlines how we collaborate, contribute, and keep things consistent.

---

## 🧠 General Workflow

We've implemented a simple system that ensures only reviewed code gets merged into the main branch. One person must review each pull request (PR) before it's merged.

1. **Sync your fork**
   Go to your GitHub forked repository page and click the **Sync fork** button to get the latest changes from `main`.

2. **Update your local main branch**
   ```bash
   git checkout main
   git pull --ff-only

3. **Create a feature branch**
   ```bash
    git checkout -b "what_youre_working_on"

4. **Make your changes**
   - Write your code, edit files, and commit changes as needed.
   - When you try to push for the first time, Git might give an error with a suggested command. Just copy and use that.

5. **Open a Pull Request**
   Push your branch to your fork and open a PR from the GitHub website.

6. **Wait for review**
   A teammate must review and approve your PR before merging it into `main.`

7. **After your PR is merged**
    - Sync your fork again from your Github repo.
    - Then in your terminal:
    ```bash
    git checkout main
    git pull --ff-only

## 📁 File Organization




