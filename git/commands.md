# Unusual GIT commands

- `Delete branch`

  ```bash
  # local
  git branch -d <name>
  ```

- `Set main as master branch`

  ```bash
  git branch -m master main
  git fetch origin
  git branch -u origin/main main
  git remote set-head origin -a
  ```

- `Create new empty branch`

  ```bash
  git checkout --orphan <name>
  git rm -rf .
  git commit --allow-empty -m "<message>"
  git push origin <name>
  ```
