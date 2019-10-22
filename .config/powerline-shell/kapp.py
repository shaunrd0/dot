from powerline_shell.themes.default import DefaultColor

# 0 — black   8 — gray
# 1 — maroon  9 — red
# 2 — green   10 — lime
# 3 — olive   11 — yellow
# 4 — navy    12 — blue
# 5 — purple  13 — fuchsia
# 6 — teal    14 — aqua
# 7 — silver  15 — white 

class Color(DefaultColor):
    """Basic theme which only uses colors in 0-15 range"""
    USERNAME_FG = 0 # black
    USERNAME_BG = 15 # white
    USERNAME_ROOT_BG = 8 # gray

    HOSTNAME_FG = 0 # black
    HOSTNAME_BG = 2 # green

    HOME_SPECIAL_DISPLAY = False
    PATH_BG = 8  # gray
    PATH_FG = 2  # silver
    CWD_FG = 15  # white
    SEPARATOR_FG = 2

    READONLY_BG = 1 # maroon
    READONLY_FG = 15 # white

    REPO_CLEAN_BG = 15   # green
    REPO_CLEAN_FG = 0   # black
    REPO_DIRTY_BG = 3   # olive
    REPO_DIRTY_FG = 15  # white

    JOBS_FG = 15 # white
    JOBS_BG = 8 # gray

    CMD_PASSED_BG = 2 # green
    CMD_PASSED_FG = 0 # black
    CMD_FAILED_BG = 11 # yellow
    CMD_FAILED_FG = 0 # black

    SVN_CHANGES_BG = REPO_DIRTY_BG
    SVN_CHANGES_FG = REPO_DIRTY_FG

    VIRTUAL_ENV_BG = 2 # green 
    VIRTUAL_ENV_FG = 0 # black

    AWS_PROFILE_FG = 14 # aqua
    AWS_PROFILE_BG = 8 # gray

    TIME_FG = 8 # gray
    TIME_BG = 7 # silver

