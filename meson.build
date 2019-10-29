project('com.github.manexim.mvc', 'vala', 'c')

gtk_plus_3_dep = dependency('gtk+-3.0')
granite_dep = dependency('granite')

dependencies = [
    gtk_plus_3_dep,
    granite_dep
]

subdir('src')
subdir('data')

meson.add_install_script('meson/post_install.py')
