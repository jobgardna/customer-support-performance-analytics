import pandas as pd
import numpy as np
import random
from datetime import datetime, timedelta

np.random.seed(42)

n = 5000
agents = [f"A{i}" for i in range(1, 21)]
channels = ["Call", "Chat", "Email"]
issues = ["Billing", "Network", "SIM", "Device"]

data = []
start_date = datetime(2025, 1, 1)

for i in range(n):
    created = start_date + timedelta(minutes=random.randint(0, 200000))
    resolution_time = random.randint(5, 60)
    resolved = created + timedelta(minutes=resolution_time)
    repeat = np.random.choice([0,1], p=[0.75,0.25])

    data.append([
        f"T{i}",
        f"C{random.randint(1,2000)}",
        random.choice(agents),
        random.choice(channels),
        random.choice(issues),
        created,
        resolved,
        repeat
    ])

df = pd.DataFrame(data, columns=[
    "ticket_id","customer_id","agent_id",
    "channel","issue_category",
    "created_date","resolved_time","repeat_flag"
])

df.to_csv("../data/processed/tickets_cleaned.csv", index=False)
