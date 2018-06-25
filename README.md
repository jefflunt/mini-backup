Why not use `rsync`? Good question. You probably should.

## Catalog your files

```shell
catalog <user@hostname OR ssh-alias>:<folder on host>
```

Ex:

```shell
catalog admin@fileserver:/home/fileserver/ > fileserver-catalog.txt
```

This will create a file where the first line mentions the username and host used
to create the catalog. Each subsequent line shows a space-delimited line of two
elements:

* A SHA256 hash
* The file associated with the hash

This catalog can be used to backup the files named in the catalog. The hashes
are used for a few things:

* To verify copied files, to make sure that each of the files was backed up
  successfully
* As the filename of the file in the backup
* De-duplication (because if two files have the same SHA256 hash, it's highly
  unlikely (though technically not impossible) for two files with different
  content to have the same hash.
* When you backup a folder you've backed up previously to the same destination,
  avoiding copying files that appear to have already been backed up can be
  skipped, which makes incremental backups much faster.

## Backup the cataloged files

```shell
backup <catalog file> <dest. folder>
```

Ex:

```shell
backup fileserver-catalog.txt /backups/
```

It's not necessary to specify the username and host when backing up from a
catalog file, because the username and root folder are noted in the catalog
file.

## Restore

```shell
restore <catalog file> <backup file source> <outfile>
```

Ex:

```shell
restore fileserver-catalog.txt /backups/ "My Favorite Song.mp3"
```
