import pathlib

_MEDIA_PATH = pathlib.Path(__file__).parent.resolve()


def _rename_dir_files(dir_name):
    dir_path = pathlib.Path.joinpath(_MEDIA_PATH, dir_name)
    for idx, item in enumerate(dir_path.iterdir(), 1):
        new_name = f"q{str(idx).zfill(2)}.png"
        print(f"Renaming {item.name} >> {new_name}")
        item.rename(pathlib.Path.joinpath(dir_path, new_name))


if __name__ == "__main__":
    dir_name = "media"
    _rename_dir_files(dir_name)
