# 1. GitFlow

You have many long running branches and you want to keep them in sync with the main branch. 
For example a main branch and a develop branch.

* **main branch:** This is the production branch. It should always be in a deployable state.
* **development branch:** This is the integration branch. It should always be in a working state and contain the latest changes.
* **feature branches:** These are the branches where you develop new features. They are branched off develop and merged back into develop when they are done.
* **release branches:** These are the branches where you prepare for a new release. They are branched off develop and merged back into main and develop when they are done.
* **hotfix branches:** These are the branches where you fix critical bugs in production. They are branched off main and merged back into main and develop when they are done.

### When does GitFlow work well?

1. When you are building software that ships in versions (old traditional way of doing things e.g. desktop apps, mobile apps, etc.)
2. When you need to suport multiple versions simultaneously (e.g. you have a legacy version that you need to maintain while developing a new version)
3. When you have a large team and need to coordinate work across multiple branches
4. If you are in an industry where changes need approval

### GitFlow's Downsides

1. Slows down your development and deployment cycle (overhead and complexity of managing multiple branches)
2. Does not play well with continuous integration and continuous deployment (CI/CD) practices
3. Not suitable for web applications that are deployed frequently

---

# 2. GitHub Flow

The core principle of GitHub Flow is to keep the main branch always in a deployable state.

### When does GitHub Flow work well?

1. Web apps that deploy continuously (e.g. SaaS applications, API, Web services, etc.)
2. When you team is small or medium size
3. When you have solid automated testing and CI/CD in pipelines
4. WHen you want to ship features instead of managing branches

### GitHub Flow's Downsides

1. It does not handle multiple versions
2. Demands disciplined developers who are comfortable with rebasing and merging
3. When multiple teams are working on the same codebase

---

# 3. Trunk Based Development

The key principle is that you integrate continuously into a single branch (trunk) and avoid long running branches.
You would need to use it with feature flags to hide incomplete features from production.

* **feature flags:** These are a technique to hide incomplete features from production. They allow you to merge incomplete features into the main branch without affecting the production code.


### When does Trunk Based Development work well?

1. Good synced developers who are comfortable with rebasing and merging
2. When you have solid automated testing and CI/CD pipelines
3. When you want rapid integration and faster deployment cycles
4. When you are shipping SaaS products with one version

### Trunk Based Development's Downsides

1. If the testing is not solid, it can lead to broken builds and production issues
2. It requires a culture of collaboration and communication among developers

