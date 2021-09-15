##Deca pinout


from pinout.core import Group, Image
from pinout.components.layout import Diagram, Panel,ClipPath
from pinout.components.pinlabel import PinLabelGroup, PinLabel
from pinout.components.text import TextBlock
from pinout.components import leaderline as lline
from pinout.components.legend import Legend


# Import data for the diagram
import data
image_width=1400
image_height=1520

# Create a new diagram
diagram = Diagram(image_width,image_height, "diagram")

# Add a stylesheet
diagram.add_stylesheet("styles.css", embed=True)

# Create a layout
content = diagram.add(
    Panel(
        width=image_width,
        height= 32,
        inset=(2, 2, 2, 2),
    )
)
panel_main = content.add(
    Panel(
        width=content.inset_width,
        height=content.inset_height,
        inset=(2, 2, 2, 2),
        tag="panel--main",
    )
)
panel_info = content.add(
    Panel(
        x=8,
        y=panel_main.height,
        width=content.inset_width-18,
        height=content.inset_height - panel_main.height,
        inset=(2, 2, 2, 2),
        tag="panel--info",
    )
)





# Create a group to hold the pinout-diagram components.
graphic = panel_main.add(Group(80, 20))

# Add and embed an image
hardware_img = graphic.add(
    Image("./deca-sch.svg", width=1134, height=1500, embed=True)
)

# Right hand side double-header
graphic.add(
    PinLabelGroup(
        x=765,
        y=1171,
        body={"width": 36, "height": 12},
        pin_pitch=(0, -19.15),
        label_start=(260, 0),
        label_pitch=(0, -19.15),
        scale=(1.0, 1.0),
        labels=data.rhs_outer_numbered,
        leaderline=lline.Diagonal(direction="vh"),
    )
)
graphic.add(
    PinLabelGroup(
        x=748,
        y=1171,
        body={"width": 36, "height": 12},
        pin_pitch=(0, -19.15),
        label_start=(75, 10), # Change diagonal length 
        label_pitch=(0, 19.15),
        scale=(1, -1),
        labels=data.rhs_inner_numbered,
        leaderline=lline.Diagonal(direction="vh"),
    )
)

# Left hand side double-header
graphic.add(
    PinLabelGroup(
        x=388,
        y=1170,
        body={"width": 36, "height": 12},
        pin_pitch=(0, -19.15),
        label_start=(77, 10),
        label_pitch=(0, -19.15),
        scale=(-1, 1),
        labels=data.lhs_inner_numbered,
        leaderline=lline.Diagonal(direction="vh"),
    )
)
graphic.add(
    PinLabelGroup(
        x=370,
        y=1170,
        body={"width": 36, "height": 12},
        pin_pitch=(0, -19.15),
        label_start=(240, 0),
        label_pitch=(0, -19.15),
        scale=(-1, 1),
        labels=data.lhs_outer_numbered,
        leaderline=lline.Diagonal(direction="vh"),
    )
)


title_block = panel_info.add(
    TextBlock(
        data.title,
        x=20,
        y=30,
        line_height=18,
        tag="panel title_block",
    )
)

panel_info.add(
    TextBlock(
        data.description,
        x=20,
        y=60,
        width=title_block.width,
        height=panel_info.height - title_block.height,
        line_height=18,
        tag="panel text_block",
    )
)


# Create a legend
legend = panel_info.add(
    Legend(
        data.legend,
        x=500,
        y=8,
        max_height=140,
    )
)


