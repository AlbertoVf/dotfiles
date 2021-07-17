from libqtile.config import Group


def group(group_labels):
    group = []
    group_names = ["1", "2", "3", "4", "5", "6", "7"]
    for i in range(len(group_names)):
        group.append(Group(
            name=group_names[i],
            label=group_labels[i],
        ))
    return group


groups = group(["Web", "Developer", "Terminal", "Vbox",
               "Planning", "System", "Multimedia"])
# groups = group(["\uf8a3", "\uf8a6", "\uf8a9",
#                "\uf8ac", "\uf8af", "\uf8b2", "\uf8b5"])

# groups = group(["\uf65e", "\uf673", "\uf68c",
#                "\uf6c4", "\ufd2c", "\uf303", "\uf721"])
