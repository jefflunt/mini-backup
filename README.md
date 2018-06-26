Two simple utilities:

### `backup source-folder destination-folder`

Make a de-duplicated, compressed backup of the entire folder structure in
`source-folder` in `destination-folder`. Inside of `destination-folder` you will
find a folder called `catalogs` where a catalog of what was backed up will be
recorded. YOU NEED THIS CATALOG IN ORDER TO RESTORE.

### `restore catalog-file destination-folder`

Take a catalog file generated using the `backup` command, and restore the files
in that catalog to a `destination-folder.

## WARNING

!!! It's critical that you keep your catalog files !!! You cannot restore the
data without them, and what good is a backup without the ability to restore?

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
