defmodule App.Worked do
  alias App.Worked.{WorkedEntry, WorkedGroup}

  @hours_in_day 7
  @work_days [1, 2]
  @coll "worked"
  @public_holiday [
                    "2025-01-01",
                    "2025-04-21",
                    "2025-05-01",
                    "2025-05-08",
                    "2025-05-29",
                    "2025-06-09",
                    "2025-07-14",
                    "2025-08-15",
                    "2025-11-01",
                    "2025-11-11",
                    "2025-12-25",
                    "2024-01-01",
                    "2024-04-01",
                    "2024-05-01",
                    "2024-05-08",
                    "2024-05-09",
                    "2024-05-20",
                    "2024-07-14",
                    "2024-08-15",
                    "2024-11-01",
                    "2024-11-11",
                    "2024-12-25",
                    "2023-01-01",
                    "2023-04-10",
                    "2023-05-01",
                    "2023-05-08",
                    "2023-05-18",
                    "2023-05-29",
                    "2023-07-14",
                    "2023-08-15",
                    "2023-11-01",
                    "2023-11-11",
                    "2023-12-25",
                    "2022-01-01",
                    "2022-04-18",
                    "2022-05-01",
                    "2022-05-08",
                    "2022-05-26",
                    "2022-06-06",
                    "2022-07-14",
                    "2022-08-15",
                    "2022-11-01",
                    "2022-11-11",
                    "2022-12-25",
                    "2021-01-01",
                    "2021-04-05",
                    "2021-05-01",
                    "2021-05-08",
                    "2021-05-13",
                    "2021-05-24",
                    "2021-07-14",
                    "2021-08-15",
                    "2021-11-01",
                    "2021-11-11",
                    "2021-12-25",
                    "2020-01-01",
                    "2020-04-13",
                    "2020-05-01",
                    "2020-05-08",
                    "2020-05-21",
                    "2020-06-01",
                    "2020-07-14",
                    "2020-08-15",
                    "2020-11-01",
                    "2020-11-11",
                    "2020-12-25",
                    "2019-01-01",
                    "2019-04-22",
                    "2019-05-01",
                    "2019-05-08",
                    "2019-05-30",
                    "2019-06-10",
                    "2019-07-14",
                    "2019-08-15",
                    "2019-11-01",
                    "2019-11-11",
                    "2019-12-25",
                    "2018-01-01",
                    "2018-04-02",
                    "2018-05-01",
                    "2018-05-08",
                    "2018-05-10",
                    "2018-05-21",
                    "2018-07-14",
                    "2018-08-15",
                    "2018-11-01",
                    "2018-11-11",
                    "2018-12-25",
                    "2017-01-01",
                    "2017-04-17",
                    "2017-05-01",
                    "2017-05-08",
                    "2017-05-25",
                    "2017-06-05",
                    "2017-07-14",
                    "2017-08-15",
                    "2017-11-01",
                    "2017-11-11",
                    "2017-12-25",
                    "2016-01-01",
                    "2016-03-28",
                    "2016-05-01",
                    "2016-05-05",
                    "2016-05-08",
                    "2016-05-16",
                    "2016-07-14",
                    "2016-08-15",
                    "2016-11-01",
                    "2016-11-11",
                    "2016-12-25",
                    "2015-01-01",
                    "2015-04-06",
                    "2015-05-01",
                    "2015-05-08",
                    "2015-05-14",
                    "2015-05-25",
                    "2015-07-14",
                    "2015-08-15",
                    "2015-11-01",
                    "2015-11-11",
                    "2015-12-25",
                    "2014-01-01",
                    "2014-04-21",
                    "2014-05-01",
                    "2014-05-08",
                    "2014-05-29",
                    "2014-06-09",
                    "2014-07-14",
                    "2014-08-15",
                    "2014-11-01",
                    "2014-11-11",
                    "2014-12-25",
                    "2013-01-01",
                    "2013-04-01",
                    "2013-05-01",
                    "2013-05-08",
                    "2013-05-09",
                    "2013-05-20",
                    "2013-07-14",
                    "2013-08-15",
                    "2013-11-01",
                    "2013-11-11",
                    "2013-12-25",
                    "2012-01-01",
                    "2012-04-09",
                    "2012-05-01",
                    "2012-05-08",
                    "2012-05-17",
                    "2012-05-28",
                    "2012-07-14",
                    "2012-08-15",
                    "2012-11-01",
                    "2012-11-11",
                    "2012-12-25",
                    "2011-01-01",
                    "2011-04-25",
                    "2011-05-01",
                    "2011-05-08",
                    "2011-06-02",
                    "2011-06-13",
                    "2011-07-14",
                    "2011-08-15",
                    "2011-11-01",
                    "2011-11-11",
                    "2011-12-25",
                    "2010-01-01",
                    "2010-04-05",
                    "2010-05-01",
                    "2010-05-08",
                    "2010-05-13",
                    "2010-05-24",
                    "2010-07-14",
                    "2010-08-15",
                    "2010-11-01",
                    "2010-11-11",
                    "2010-12-25",
                    "2009-01-01",
                    "2009-04-13",
                    "2009-05-01",
                    "2009-05-08",
                    "2009-05-21",
                    "2009-06-01",
                    "2009-07-14",
                    "2009-08-15",
                    "2009-11-01",
                    "2009-11-11",
                    "2009-12-25",
                    "2008-01-01",
                    "2008-03-24",
                    "2008-05-01",
                    "2008-05-08",
                    "2008-05-12",
                    "2008-07-14",
                    "2008-08-15",
                    "2008-11-01",
                    "2008-11-11",
                    "2008-12-25",
                    "2007-01-01",
                    "2007-04-09",
                    "2007-05-01",
                    "2007-05-08",
                    "2007-05-17",
                    "2007-05-28",
                    "2007-07-14",
                    "2007-08-15",
                    "2007-11-01",
                    "2007-11-11",
                    "2007-12-25",
                    "2006-01-01",
                    "2006-04-17",
                    "2006-05-01",
                    "2006-05-08",
                    "2006-05-25",
                    "2006-06-05",
                    "2006-07-14",
                    "2006-08-15",
                    "2006-11-01",
                    "2006-11-11",
                    "2006-12-25",
                    "2005-01-01",
                    "2005-03-28",
                    "2005-05-01",
                    "2005-05-05",
                    "2005-05-08",
                    "2005-05-16",
                    "2005-07-14",
                    "2005-08-15",
                    "2005-11-01",
                    "2005-11-11",
                    "2005-12-25",
                    "2004-01-01",
                    "2004-04-12",
                    "2004-05-01",
                    "2004-05-08",
                    "2004-05-20",
                    "2004-05-31",
                    "2004-07-14",
                    "2004-08-15",
                    "2004-11-01",
                    "2004-11-11",
                    "2004-12-25",
                    "2003-01-01",
                    "2003-04-21",
                    "2003-05-01",
                    "2003-05-08",
                    "2003-05-29",
                    "2003-06-09",
                    "2003-07-14",
                    "2003-08-15",
                    "2003-11-01",
                    "2003-11-11",
                    "2003-12-25",
                    "2002-01-01",
                    "2002-04-01",
                    "2002-05-01",
                    "2002-05-08",
                    "2002-05-09",
                    "2002-05-20",
                    "2002-07-14",
                    "2002-08-15",
                    "2002-11-01",
                    "2002-11-11",
                    "2002-12-25",
                    "2001-01-01",
                    "2001-04-16",
                    "2001-05-01",
                    "2001-05-08",
                    "2001-05-24",
                    "2001-06-04",
                    "2001-07-14",
                    "2001-08-15",
                    "2001-11-01",
                    "2001-11-11",
                    "2001-12-25",
                    "2000-01-01",
                    "2000-04-24",
                    "2000-05-01",
                    "2000-05-08",
                    "2000-06-01",
                    "2000-06-12",
                    "2000-07-14",
                    "2000-08-15",
                    "2000-11-01",
                    "2000-11-11",
                    "2000-12-25"
                  ]
                  |> Enum.map(fn e -> Timex.parse!(e, "{YYYY}-{0M}-{0D}") end)

  def coll do
    @coll
  end

  def add_entry(api, date, duration) do
    Api.DataApi.create_doc(
      api,
      @coll,
      %WorkedEntry{
        date: date,
        duration: duration
      }
    )
  end

  def remove_entry(api, id) do
    Api.DataApi.delete_doc(api, @coll, id)
  end

  def get_mine_query() do
    %{
      "user" => "@me"
    }
  end

  def compute_entries(entries) do
    entries
    |> group_by_month()
    |> compute_stats()
  end

  def normalize_entries(entries) do
    Enum.map(
      entries,
      fn %WorkedEntry{} = entry ->
        entry
        |> Map.put(:created_at, Timex.parse!(entry.created_at, "{ISO:Extended}"))
        |> Map.put(:date, Timex.parse!(entry.date, "{ISO:Extended}"))
      end
    )
  end

  defp group_by_month(entries) do
    Enum.reduce(
      entries,
      %{},
      fn %WorkedEntry{} = entry, acc ->
        month_year = get_key(entry.date)

        list =
          if not Map.has_key?(acc, month_year),
            do: [],
            else: Map.get(acc, month_year)

        list = [entry | list]
        Map.put(acc, month_year, list)
      end
    )
  end

  defp get_key(date) do
    {
      Timex.format!(date, "{Mfull}") |> Timex.month_to_num(),
      Timex.format!(date, "{YYYY}") |> Integer.parse() |> elem(0)
    }
  end

  defp compute_stats(groupes) do
    do_compute_stats(nil, Map.to_list(groupes), [])
    |> Enum.reverse()
  end

  defp do_compute_stats(nil, [current | rest], acc) do
    res = compute_group(0, current)
    do_compute_stats(res, rest, [res | acc])
  end

  defp do_compute_stats({_, entry}, [current | rest], acc) do
    res = compute_group(entry.remaining_hours, current)
    do_compute_stats(res, rest, [res | acc])
  end

  defp do_compute_stats(_last, [], acc) do
    acc
  end

  defp compute_group(last_remaining, {{month, year}, entries}) do
    nb_working_hours = get_nb_working_days(year, month) * @hours_in_day
    begin = Timex.beginning_of_month(year, month)

    computed =
      Enum.reduce(
        entries,
        %WorkedGroup{
          month: begin,
          total_duration: 0,
          entries: [],
          nb_working_hours: nb_working_hours,
          remaining_hours: nb_working_hours + last_remaining
        },
        &compute_elem/2
      )

    {{month, year}, computed}
  end

  def compute_elem(
        %WorkedEntry{} = entry,
        %WorkedGroup{
          total_duration: total_duration,
          entries: entries,
          remaining_hours: remaining_hours
        } = wg
      ) do
    wg
    |> Map.put(:total_duration, total_duration + entry.duration)
    |> Map.put(:remaining_hours, remaining_hours - entry.duration)
    |> Map.put(:entries, [entry | entries])
  end

  def get_nb_working_days(year, month) do
    begin = Timex.beginning_of_month(year, month)

    0..(Timex.days_in_month(year, month) - 1)
    |> Enum.count(fn nb ->
      current = Timex.add(begin, Timex.Duration.from_days(nb))
      day_of_week = Timex.weekday(current)

      day_of_week in @work_days and
        not Enum.any?(
          @public_holiday,
          fn hol -> Timex.diff(current, hol) == 0 end
        )
    end)
  end
end
