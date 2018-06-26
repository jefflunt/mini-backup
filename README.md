Two simple utilities:

```bash
backup source-folder destination-folder
```

Make a de-duplicated, compressed backup of the entire folder structure from
`source-folder` to `destination-folder`. Inside of `destination-folder` you will
find a sub-folder called `catalogs` where a catalog of what was backed up will
be recorded. YOU NEED THIS CATALOG IN ORDER TO RESTORE.

```bash
restore catalog-file destination-folder
```

Take a catalog file generated using the `backup` command, and restore the files
in that catalog to a `destination-folder.

## WARNING

IN ORDER TO RESTORE FROM BACKUPS:

You must keep the `.catalog` files. Do not move, rename, or alter them in any
way. They are intended to be managed entirely by the `backup`/`restore`
utilities.

## Example usage

```shell
backup music/ backups/
restore 20180625.120100.music.catalog music-restore/
```

Running these commands will:

* `backup`
  * Create a `backups/` folder if it doesn't exist
  * Make de-duplicated, compressed versions of all files in the source-folder inside of
* `restore`
  * Create a `music-restores/` folder if it doesn't exist
  * Read the specified catalog file, generated from the `backup` command
  * Restore an decompressed, re-duplicated version of all files from `music/`
    to `music-restore/music/`
