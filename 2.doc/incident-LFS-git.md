# INCIDENT Large File System into git

## abstract:
A wal file has been added to the repo. This type of file is a database backup.
This is a common issue solution is known. 

## ITSM flow
### how should it be avoided?
Generally speaking it is best to have a pre-built .gitignore file. This file is used to ignore files that are not needed to commit. But in particular case it is hard to identify the culprit of large files.
Another best practice is to commit files 1 by 1.

### blocking
The target git repository is not accepting large files due to unknown reasons. (this is not normal in 2022 but hey ok...)

### rootcause
the development of an app led to unforseen consequences. A goldfish had a hiccup.

### cascading stuff
Because of the nature of git to track files delta, it is not possible to just delete the file. Git history has to be ammended (modified). All references to the file must be removed from the git tree history.

### actions
unprotect all the branches
build a bfg tool
cleaned repo with the tool
write documentation && update tool documentation
force push stuff
2h later it should be done

### agent
git owner > force pushed on main branch


## LOGS

```s
Using repo : /code/.git

Scanning packfile for large blobs: 438
Scanning packfile for large blobs completed in 30 ms.
Found 6 blob ids for large blobs - biggest=522765817 smallest=278300641
Total size (unpacked)=2222141559
Found 145 objects to protect
Found 7 commit-pointing refs : HEAD, refs/heads/main, refs/remotes/origin/HEAD, ...

Protected commits
-----------------

These are your protected commits, and so their contents will NOT be altered:

 * commit 6aefe741 (protected by 'HEAD')

Cleaning
--------

Found 13 commits
Cleaning commits:       100% (13/13)
Cleaning commits completed in 96 ms.

Updating 5 Refs
---------------

	Ref                          Before     After
	------------------------------------------------
	refs/heads/main            | 6aefe741 | f1163d7c
	refs/remotes/origin/github | 6aefe741 | f1163d7c
	refs/remotes/origin/main   | 6aefe741 | f1163d7c
	refs/remotes/origin/setup  | 82e01fef | eb0358ed
	refs/remotes/origin/test   | dcae5762 | 1ceffb20

Updating references:    100% (5/5)
...Ref update completed in 24 ms.

Commit Tree-Dirt History
------------------------

	Earliest      Latest
	|                  |
	. .. .D DD D DD mm m

	D = dirty commits (file tree fixed)
	m = modified commits (commit message or parents changed)
	. = clean commits (no changes to file tree)

	                        Before     After
	-------------------------------------------
	First modified commit | 536c373b | fda3c653
	Last dirty commit     | 93318d98 | 37f83dcc

Deleted files
-------------

	Filename       Git id
	------------------------------------------------------------
	00000001.wal | 8adbebd6 (312.9 MB), db569694 (305.1 MB), ...


In total, 51 object ids were changed. Full details are logged here:

	/code.bfg-report/2022-06-03/09-20-21

BFG run is complete! When ready, run: git reflog expire --expire=now --all && git gc --prune=now --aggressive
```

##### another issue
```s
docker run --rm -v $PWD:/code -w /code docker-bfg --strip-blobs-bigger-than 49M

Using repo : /code/.git

Scanning packfile for large blobs: 659
Scanning packfile for large blobs completed in 30 ms.
Found 8 blob ids for large blobs - biggest=522765817 smallest=52756607
Total size (unpacked)=2330784058
Found 146 objects to protect
Found 9 commit-pointing refs : HEAD, refs/heads/main, refs/remotes/origin/HEAD, ...

Protected commits
-----------------

These are your protected commits, and so their contents will NOT be altered:

 * commit 7b67b84a (protected by 'HEAD')

Cleaning
--------

Found 61 commits
Cleaning commits:       100% (61/61)
Cleaning commits completed in 142 ms.

Updating 7 Refs
---------------

	Ref                                   Before     After
	---------------------------------------------------------
	refs/heads/main                     | 7b67b84a | 9121329d
	refs/remotes/origin/cicd            | eb551141 | b415dc5a
	refs/remotes/origin/github          | 6aefe741 | 9289c043
	refs/remotes/origin/main            | 7b67b84a | 9121329d
	refs/remotes/origin/revert-56336056 | fb81f7e8 | 164cede4
	refs/remotes/origin/setup           | 82e01fef | 6c0d15fe
	refs/remotes/origin/test            | dcae5762 | 21e0e28f

Updating references:    100% (7/7)
...Ref update completed in 17 ms.

Commit Tree-Dirt History
------------------------

	Earliest                                              Latest
	|                                                          |
	....DDDDDDDDDDDmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

	D = dirty commits (file tree fixed)
	m = modified commits (commit message or parents changed)
	. = clean commits (no changes to file tree)

	                        Before     After
	-------------------------------------------
	First modified commit | fda3c653 | 95d88c0f
	Last dirty commit     | 37f83dcc | f11dff20

Deleted files
-------------

	Filename       Git id
	------------------------------------------------------------
	00000001.wal | 8adbebd6 (312.9 MB), db569694 (305.1 MB), ...


In total, 127 object ids were changed. Full details are logged here:

	/code.bfg-report/2022-06-03/16-10-56

BFG run is complete! When ready, run: git reflog expire --expire=now --all && git gc --prune=now --aggressive
[banana@msi108
```