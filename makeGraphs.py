import matplotlib.pyplot as plt
import numpy as np

# make data                                                                                                                                                     
x1  = np.genfromtxt('./NYTbs', delimiter='|', dtype=float, skip_header=1)
x2  = np.genfromtxt('./notNYTbs', delimiter='|', dtype=float, skip_header=1)

# get just the average review column                                                                                                                            
average_reviews1 = x1[:, 1]
average_reviews2 = x2[:, 1]
# plot:                                                                                                                                                         
fig, (ax1, ax2) = plt.subplots(2)

# for NYTbs
ax1.hist(average_reviews1, bins=15, linewidth=0.5, edgecolor="red", color = "pink")

ax1.set(xlim=(0, 5), xticks=np.arange(1, 6),
       ylim=(0, 1750), yticks=np.linspace(0,1750, 9))

ax1.set_xlabel("Star Rating")
ax1.set_ylabel("# Books Reviewed")
ax1.set_title("New York Times Bestsellers")

# for not NYTbs
ax2.hist(average_reviews2, bins=15, linewidth=0.5, edgecolor="dodgerblue", color = "turquoise")

ax2.set(xlim=(0, 5), xticks=np.arange(1, 6),
       ylim=(0, 1750), yticks=np.linspace(0,1750, 9))

ax2.set_xlabel("Star Rating")
ax2.set_ylabel("# Books Reviewed")
ax2.set_title("Other Books")

# add space bewteen the two plots
plt.subplots_adjust(hspace=.5)

plt.savefig('graphs.pdf')
