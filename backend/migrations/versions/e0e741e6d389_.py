"""empty message

Revision ID: e0e741e6d389
Revises: 4dcc26af386a
Create Date: 2025-03-19 15:53:07.983559

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = 'e0e741e6d389'
down_revision = '4dcc26af386a'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('homework_statistic', schema=None) as batch_op:
        batch_op.drop_column('score1')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('homework_statistic', schema=None) as batch_op:
        batch_op.add_column(sa.Column('score1', mysql.FLOAT(), nullable=True))

    # ### end Alembic commands ###
