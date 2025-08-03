package initialize

import (
	"log"

	"github.com/robfig/cron/v3"
)

func InitCron() *cron.Cron {
	log.Println("InitCron start ...............")
	c := cron.New(cron.WithSeconds())
	return c
}
