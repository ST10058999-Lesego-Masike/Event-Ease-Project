using System;
using System.Collections.Generic;

namespace EventEaseProject.Models;

public partial class Event
{
    public int EventId { get; set; }

    public string EventDate { get; set; } = null!;

    public string EventDescription { get; set; } = null!;

    public virtual ICollection<Booking> Bookings { get; set; } = new List<Booking>();
}
